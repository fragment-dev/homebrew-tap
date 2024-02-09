require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4528.0.0-darwin-x64.tar.gz"
    sha256 "86360fb07ef42f55948456bda8b2e8aaed8fce4a63d78e9e9cb1a8b6adc6831d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4528.0.0-darwin-arm64.tar.gz"
      sha256 "12aca8d4a7331c5f741f50ab8902b765656e9fd2510627eb55942b61793d4076"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4528.0.0-linux-x64.tar.gz"
    sha256 "198109e27e843b3e4aff60aaf317cc04b7dfea66bc3e3a933dd765b02446a621"
  end
  version "4528.0.0"
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
