require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4486.0.0-darwin-x64.tar.gz"
    sha256 "6c867e4d662a3d271c1df498d3bead6f4bc8905cd0e007910fa14e1d4187060a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4486.0.0-darwin-arm64.tar.gz"
      sha256 "2a4e720dd0292c70d3ef6f3860d1ab34ff9dac22866ded9ca1a7267a54581adc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4486.0.0-linux-x64.tar.gz"
    sha256 "b3a300cafc75c4e3602f879ea26e72eec7cd5decddb4c11a30c52d6b92e66551"
  end
  version "4486.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
