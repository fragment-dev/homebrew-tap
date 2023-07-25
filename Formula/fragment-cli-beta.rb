require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3162.0.0-darwin-x64.tar.gz"
    sha256 "83231c7882264519c4da4a08d8bd536041c1dd7e8a1a85f5a03d8225dbe906df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3162.0.0-darwin-arm64.tar.gz"
      sha256 "87273d4119460a694b5cfa7c3caf9ea237a063bbacf3bb70d2b78c2a361a7d30"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3162.0.0-linux-x64.tar.gz"
    sha256 "d5e491994651f4a393e700796fdf7f5039c5b3c508967686d5e4cf64737758b2"
  end
  version "3162.0.0"
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
