require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3439.0.0-darwin-x64.tar.gz"
    sha256 "af059cfc35055ce61043f6c31bd657b9b9f59ff15b5a29728940cfb1b5cebefe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3439.0.0-darwin-arm64.tar.gz"
      sha256 "89199da927a1d311de1fab5fa2016efd2ca9e4b3d6bdcaefe1d21f14eb328e3a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3439.0.0-linux-x64.tar.gz"
    sha256 "6c3eff5d9efc410c42cba8d3999a2a8288d3a6f0d603324696736ea602b6e8dc"
  end
  version "3439.0.0"
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
