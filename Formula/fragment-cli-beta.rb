require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4399.0.0-darwin-x64.tar.gz"
    sha256 "233380e74c79195571f66ee447de3159e18821f912da552dcfd2cf12ce37ae92"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4399.0.0-darwin-arm64.tar.gz"
      sha256 "261370d9e8b5c5dae8a6545af8693f9a6aab71967b001dadd26b0460d27ff52f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4399.0.0-linux-x64.tar.gz"
    sha256 "5238c82b4cf8f348aa346c6f17231f4e203416d5ed7effc368072080f4486419"
  end
  version "4399.0.0"
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
