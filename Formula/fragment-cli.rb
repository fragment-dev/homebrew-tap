require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.23-darwin-x64.tar.gz"
    sha256 "cfcbb4c4d340a2f9ce35d08b007a0243466dea1a11d35ae1aead1eb17fe7e191"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.23-darwin-arm64.tar.gz"
      sha256 "ae52dc4179046a28f077fc858648bd463e89b66a9a0b64353a6f4cd5115470e5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.23-linux-x64.tar.gz"
    sha256 "b82fd8782a6ddd68536613584559ca9d0428ff4f8189a7da33b4cf2feb5c19a5"
  end
  version "2024.7.23"
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
