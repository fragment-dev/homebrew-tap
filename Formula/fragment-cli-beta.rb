require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3464.0.0-darwin-x64.tar.gz"
    sha256 "2c284037566d015592c4dd1305f82a10f853574e06cf42dc2e05b372d535d764"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3464.0.0-darwin-arm64.tar.gz"
      sha256 "4dada6a72a92938eab3ca85bb1be8a3c4c2e13237ede92c9c9c27166992c52ae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3464.0.0-linux-x64.tar.gz"
    sha256 "a04dbcfe94c56d9d7f709677516f4906d8ea64131f3e9b6c4c967a0cf0a6953b"
  end
  version "3464.0.0"
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
