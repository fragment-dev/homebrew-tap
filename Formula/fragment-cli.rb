require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.30-1-darwin-x64.tar.gz"
    sha256 "ae6f4fe48dc033c755572ddb7201e4e15de222fb9737fc4d2c52bcc7c23b6ccf"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.30-1-darwin-arm64.tar.gz"
      sha256 "3ac6fe225cd1b9f8b6167303d806fce5ae5433650c4e22929df16b74b927fc2a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.30-1-linux-x64.tar.gz"
    sha256 "62ea5161ced4b65e4e17ffb8bc6d398a5781885ba5d7746d13b78161b5d5f050"
  end
  version "2024.5.30-1"
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
