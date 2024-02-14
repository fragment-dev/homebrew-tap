require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.14-1-darwin-x64.tar.gz"
    sha256 "fc67c4dd43e4a2730573668fc3fd43f6b40d9a7509d084ce0b0b0c6cc7552393"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.14-1-darwin-arm64.tar.gz"
      sha256 "c60f01f92ea62a2cb45f951854cff2fe5a25dbc7f93baa6e055de52a89517e20"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.14-1-linux-x64.tar.gz"
    sha256 "215ac5211eae5ff8efe56b1abfc527a5b833460e0355ba6d33a83e59e764204d"
  end
  version "2024.2.14-1"
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
