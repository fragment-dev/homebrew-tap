require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6108.0.0-darwin-x64.tar.gz"
    sha256 "cbc79984c2be9079089da9a4067a5f06bd66a14959b5c6cc7a6ea52fa67cc65d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6108.0.0-darwin-arm64.tar.gz"
      sha256 "db6a2e064648aaf076c1f13582c7840727fecc35143bb9570bfdd41ffe92b4be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6108.0.0-linux-x64.tar.gz"
    sha256 "05fc1b677e324a27c323cab1e3772c0b3699974c4dca679c9620c4fa27f0cdc6"
  end
  version "6108.0.0"
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
