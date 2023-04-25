require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2523.0.0-darwin-x64.tar.gz"
    sha256 "2d37fce6da4dbb8d3dc7d28717af6968449eea070347ad1b86b00a18ffdbc6d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2523.0.0-darwin-arm64.tar.gz"
      sha256 "fc510379983ae4c266f1e13bd8fcbd5cf9843103c38f01339b1a017f190f6156"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2523.0.0-linux-x64.tar.gz"
    sha256 "b8c3bc1a54053c104ef7a513dda9d2e3b576c37508d6d856aabc871c856d9b24"
  end
  version "2523.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
