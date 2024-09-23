require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5613.0.0-darwin-x64.tar.gz"
    sha256 "2f95c73afda65bf302385a33928e889125253694f20a590238f8ad527ff637b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5613.0.0-darwin-arm64.tar.gz"
      sha256 "cd7b67c9bcae63fdcf392541dac13f95d989f60bd4aa3f01d6252e2c9883bcbe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5613.0.0-linux-x64.tar.gz"
    sha256 "971e1d155ff72e5b06d1989738da8f54f6c4fc7324ffc9153d7800431096c5e8"
  end
  version "5613.0.0"
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
