require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-darwin-x64.tar.gz"
    sha256 "be6595be41563cc66cbd74ecb5d8805fb783c6d5ad0af330e1438ddacb63122c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-darwin-arm64.tar.gz"
      sha256 "c368898c17972d9c78e388503a48d37bdeb4fc4e9a02fbd616e28d77368f7f01"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.5-linux-x64.tar.gz"
    sha256 "e538176f0d026810ea1dbffa43126b27ceeb77ede608845cb2dee8bb883033cd"
  end
  version "2023.5.5"
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
