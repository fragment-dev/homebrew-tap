require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.5-1-darwin-x64.tar.gz"
    sha256 "90f06b5d93cf1aa9fd06c6927dfc2868721da7eb1de6ffd6d61a2c6884210982"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.5-1-darwin-arm64.tar.gz"
      sha256 "34951c562f7f3861fceb6c755422bdd18fd1e4801c378b37af77d709cb57c312"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.5-1-linux-x64.tar.gz"
    sha256 "ebdbba35b2d345ef0216d187879de791a0f8cf8d5464f00441f2d686b4161728"
  end
  version "2024.2.5-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
