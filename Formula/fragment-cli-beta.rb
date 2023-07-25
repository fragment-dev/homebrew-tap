require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3161.0.0-darwin-x64.tar.gz"
    sha256 "24f27c504a7af2a4cb2248c3f0d84d9e2c366876ffb69ba35e08f445400c8ff3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3161.0.0-darwin-arm64.tar.gz"
      sha256 "279661b0dac7fccabdd8ea6dbbc265f1afd17a0c0679bf7136053b19d3502905"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3161.0.0-linux-x64.tar.gz"
    sha256 "ed3af73b21173fe986cf4001f8a389799872e624c57a66e26aa0081ed3c8aff2"
  end
  version "3161.0.0"
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
