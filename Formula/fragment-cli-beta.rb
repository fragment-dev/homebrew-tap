require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3687.0.0-darwin-x64.tar.gz"
    sha256 "562bb50d14fe753c1658b18691d08d932b4ea019beb09521111f5edf29578a34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3687.0.0-darwin-arm64.tar.gz"
      sha256 "dcda3d3167f2f9bea7d55dff68d6c6aa9cda426db49b6b7c685c4ccc27bcd1d4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3687.0.0-linux-x64.tar.gz"
    sha256 "eb81f8d452d169a7c279e7c98cc49cb48f9204d1b18a86bb7eed1eb7857430b9"
  end
  version "3687.0.0"
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
