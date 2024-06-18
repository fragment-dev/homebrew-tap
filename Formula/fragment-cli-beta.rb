require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5292.0.0-darwin-x64.tar.gz"
    sha256 "5646e055474700100ab842c3855168c5ec453007f67dd9295685b6c2295de0fc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5292.0.0-darwin-arm64.tar.gz"
      sha256 "e8e854a7b4f7cd70500ef03d9f6793b52ff9e9bbf7079693068f4046c69a8510"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5292.0.0-linux-x64.tar.gz"
    sha256 "80e7b5780112b63d0a8270fb3319be490ce6bd3efd021a93a5f673282a104f41"
  end
  version "5292.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
