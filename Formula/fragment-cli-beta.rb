require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2522.0.0-darwin-x64.tar.gz"
    sha256 "57fa53972f0397d18b38c7c0289eb9e71bcc17bafb5ef6b919ef7e14af7c9f5d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2522.0.0-darwin-arm64.tar.gz"
      sha256 "66a956ae1f9cd3a049f5c9d7f55efc87b3ead4c2b56d474ac648fec2700a8938"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2522.0.0-linux-x64.tar.gz"
    sha256 "99af319b49eaafabcc8bb1b38c327bb051ff45effca49dd23ff6a4d7d7e16648"
  end
  version "2522.0.0"
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
