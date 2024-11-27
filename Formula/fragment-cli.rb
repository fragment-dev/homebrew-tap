require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.27-darwin-x64.tar.gz"
    sha256 "f25366be21470ee59095298ef0cab2e5de7c62da16c457ecac0ce08fe64c1e4e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.27-darwin-arm64.tar.gz"
      sha256 "735bebe362f508637550b02d99ccb41421dfc595a7a452ef1088a183691054ec"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.27-linux-x64.tar.gz"
    sha256 "a1e9ec77c56af6b4fd8074d09d6bc1ecdb9fa2e962cae23ae4b307bad8bd39ec"
  end
  version "2024.11.27"
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
