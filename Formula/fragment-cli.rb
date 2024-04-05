require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.4-darwin-x64.tar.gz"
    sha256 "0d32f4fa98b837ccf1fefaa429006e6bbe1f9fcd875fc2583e0ae56f47fe8a32"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.4-darwin-arm64.tar.gz"
      sha256 "13207d8a91b3f72203a5fb082c2618c14103bfa4ac21f021ff487a48ef21130a"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.4-linux-x64.tar.gz"
    sha256 "3ddecaaa9390885017174d145ae10d7e68349f3a6aa2c8b72365d291bd10279b"
  end
  version "2024.4.4"
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
