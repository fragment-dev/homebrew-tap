require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3322.0.0-darwin-x64.tar.gz"
    sha256 "9dbd8fe41955254ed37841c699b7890229f06217c0ba7abb81a79585ef4995de"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3322.0.0-darwin-arm64.tar.gz"
      sha256 "8d04ed3bc9d794da1489f66509665ee42ab84e9056eb9179302dfbfd71d8539c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3322.0.0-linux-x64.tar.gz"
    sha256 "6802605a3004ae36729ad52e178192d5f803038dce5c959034a6ec62b028273a"
  end
  version "3322.0.0"
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
