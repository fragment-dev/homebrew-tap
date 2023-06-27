require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.27-1-darwin-x64.tar.gz"
    sha256 "0509e6abdc842ef5f7e9dc5d43c5f267d502cd75815327108cff45186aa5fcea"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.27-1-darwin-arm64.tar.gz"
      sha256 "7042afac583594a871744b8dd04a995da38a5eee4039cd0379bafdde1dc0c060"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.27-1-linux-x64.tar.gz"
    sha256 "f609ff146c90706de56e7792ba56fc2650c4f0f216e31f6626365db4436c7956"
  end
  version "2023.6.27-1"
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
