require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.14-1-darwin-x64.tar.gz"
    sha256 "7c5925e5a85db542313bf5318198e100944df90533d32ac52562a80af19b850f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.14-1-darwin-arm64.tar.gz"
      sha256 "904395ee127b60328b36d7e4933041ec8811a37761fee5288a44f9a3f7cfa27b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.14-1-linux-x64.tar.gz"
    sha256 "72a7003ad393fa243f97452db060e2a2e11499d22beac935294010b4313edf1c"
  end
  version "2024.11.14-1"
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
