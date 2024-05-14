require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-darwin-x64.tar.gz"
    sha256 "e92956119b47edfce1225f6337352a199cf5c0ef37214957392d13b7bfa0ef38"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-darwin-arm64.tar.gz"
      sha256 "8d57b35a0dc59bace392a4fed9921ae662b7a260ecda0e66f3728058209e91a3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.14-linux-x64.tar.gz"
    sha256 "1504633cbce90346e145de7b2c9b96734a06f9e515f2b74dc72d75cd0a8eafca"
  end
  version "2024.5.14"
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
