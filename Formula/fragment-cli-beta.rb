require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5989.0.0-darwin-x64.tar.gz"
    sha256 "2af5086b7e5ffba364408a28618686b80101881265196eb1f6a2696d98d2c17c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5989.0.0-darwin-arm64.tar.gz"
      sha256 "c86fc23ea6c297624b256847a9fe63c44237eabd0b453f995fc07f7e30077ee3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5989.0.0-linux-x64.tar.gz"
    sha256 "8ae220914f98c9285fc8269f4fdb3bee57fce1de728ccf73c5b6aa812470251c"
  end
  version "5989.0.0"
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
