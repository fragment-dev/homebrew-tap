require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3581.0.0-darwin-x64.tar.gz"
    sha256 "131c59793a115f1b8c599756ef510a3c892b5387aa4b9926b05eccfe7e9862ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3581.0.0-darwin-arm64.tar.gz"
      sha256 "04a8e14821cb3a37e1a5f1d906f75d5618b416271e447fdb9f0cacba7fa363ba"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3581.0.0-linux-x64.tar.gz"
    sha256 "3e89122d2fc241afef1ee862c714d062f590aaa662ee16fa0eefd3bde5a6ca9f"
  end
  version "3581.0.0"
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
