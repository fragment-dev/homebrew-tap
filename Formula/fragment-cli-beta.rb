require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3815.0.0-darwin-x64.tar.gz"
    sha256 "e6a835a970c3a460bb514346f0e7e061a2e5088224c79d745ddbdc472ccca732"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3815.0.0-darwin-arm64.tar.gz"
      sha256 "5223b7b1fcdacc37429cb7b10d46a072cd9d1ee80a1d437bb7f6c88c4ba0369a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3815.0.0-linux-x64.tar.gz"
    sha256 "dba1983366e13f00ea20a964cff159082d25d140b4b07eeb5950ccdd9376bb6b"
  end
  version "3815.0.0"
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
