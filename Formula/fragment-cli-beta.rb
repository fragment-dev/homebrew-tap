require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5051.0.0-darwin-x64.tar.gz"
    sha256 "98972d689cf1f7046ffa493e29d7378eaedc4fb0df6452151206ae789cc7b3b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5051.0.0-darwin-arm64.tar.gz"
      sha256 "41d899f7c87faf8d78dfc2f0e78eba2fc5ec05844792efcfca5fb623a2dd18ef"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5051.0.0-linux-x64.tar.gz"
    sha256 "64fb114d3193d81c1dbfc1692df1984c738c17e4df585cc9d1b42e68e6070611"
  end
  version "5051.0.0"
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
