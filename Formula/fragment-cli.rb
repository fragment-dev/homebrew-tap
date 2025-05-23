require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.23-darwin-x64.tar.gz"
    sha256 "05a99b5b09019e2bc9f3e505c764370c4c33686bc27c72a09c4cc66f0adc2ff7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.23-darwin-arm64.tar.gz"
      sha256 "1cb0c6dd3a0e61e5edfe6803da9d535fb5dd4fb0d4d47f8ee408c807ee3dc796"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.5.23-linux-x64.tar.gz"
    sha256 "fc3b2aa876d62b3054ab0ab59f12aab57169216f78a3e6d489e3e3ba684ad9bf"
  end
  version "2025.5.23"
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
