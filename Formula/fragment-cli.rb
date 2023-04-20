require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.20-1-darwin-x64.tar.gz"
    sha256 "1afd331ec5eaf932d5ebffd4598158b8b2e8057ee0bea847730a96259ae88535"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.20-1-darwin-arm64.tar.gz"
      sha256 "886eb8ac4dfc5aec86c0c8262b22bdee583cdc4a799285b0648cff11e89fbefc"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.20-1-linux-x64.tar.gz"
    sha256 "d3976590efb1131b21514832c5c6c0db24d20e52865fe8480f127c85722c637f"
  end
  version "2023.4.20-1"
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
