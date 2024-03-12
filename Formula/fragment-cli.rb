require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.12-darwin-x64.tar.gz"
    sha256 "c604ed20c7379979e0e3db1ed849b50ef1b720ba0a9dd9ce0ce346fe74259ae8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.12-darwin-arm64.tar.gz"
      sha256 "3a060c2e173b0b409194647210f471bec8fba72df58a9b3702ec45204fc62500"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.12-linux-x64.tar.gz"
    sha256 "df746b82237d9c085296b9c336a929887ef253db333c178a3f2ed1d33273b17f"
  end
  version "2024.3.12"
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
