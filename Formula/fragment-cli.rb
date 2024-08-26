require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.26-1-darwin-x64.tar.gz"
    sha256 "00e32eda638247fe4d375cd6e520d80d9248bc65e0a859ab1baf7068b289faef"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.26-1-darwin-arm64.tar.gz"
      sha256 "ab9dba3802b0780864dbf18c6dfd991b9507233bca8b08dec6aaf4f56ab35010"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.26-1-linux-x64.tar.gz"
    sha256 "3af5bed1e913405dd52148ea88da7aecbedc030df6726d63208da2f5e4dc01b2"
  end
  version "2024.8.26-1"
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
