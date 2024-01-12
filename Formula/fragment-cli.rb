require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.11-1-darwin-x64.tar.gz"
    sha256 "c776a8c6c4853ee099d8754874dd615f4159c5e7de65e5251f8b84452c722da6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.11-1-darwin-arm64.tar.gz"
      sha256 "c8470d471c5fcd46f9ff3aa951ed3b164db7961b03c53bfdc6f11983a4f45b06"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.11-1-linux-x64.tar.gz"
    sha256 "69f1d548678bb46bddefd3a2a81a30d1d1b9589cc71b84468e91bc5d03135289"
  end
  version "2024.1.11-1"
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
