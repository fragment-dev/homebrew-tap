require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.8-darwin-x64.tar.gz"
    sha256 "d4bf32915b9e74f6f69e2e1cf79794ae9820b9738a90a6441776888ac2a1b7b3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.8-darwin-arm64.tar.gz"
      sha256 "de520f75483200fedb718e954bced08ab4cfd0074bc0fb3ce4051c86ad5389e5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.8-linux-x64.tar.gz"
    sha256 "8fbc21b45e1d074fdf042f3fdf4aa8106e45922b9bdcc27606ae224cc5b15d89"
  end
  version "2024.8.8"
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
