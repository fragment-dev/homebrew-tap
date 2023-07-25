require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3154.0.0-darwin-x64.tar.gz"
    sha256 "67ef620b026968c5b1efc1b356b3b1bf66143df0ae0ca4059017d0c637bec2d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3154.0.0-darwin-arm64.tar.gz"
      sha256 "c252484156de85cb97a3a700f6fa11033b867f604c8fffd3ebce14d8661a35b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3154.0.0-linux-x64.tar.gz"
    sha256 "658a0da53bce9d112014e80451eff6b0329d98828ef720533ed7326263ed44b4"
  end
  version "3154.0.0"
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
