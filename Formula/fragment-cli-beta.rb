require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3044.0.0-darwin-x64.tar.gz"
    sha256 "17ff2c2cc8fc17529905058cc3ee62519798568c90ac519e3dd7c49562c5b780"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3044.0.0-darwin-arm64.tar.gz"
      sha256 "556fe57c5548748168c0177e4ea95f850fc3ba63ce7f276d53e588aba3dceab5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3044.0.0-linux-x64.tar.gz"
    sha256 "a63829a78870031f7b4752464a0b38e3a14c81dc6e5595e62dc2a48d5731257b"
  end
  version "3044.0.0"
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
