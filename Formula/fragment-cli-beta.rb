require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4325.0.0-darwin-x64.tar.gz"
    sha256 "8f77346ad7bb8b15e62d9fbcd5fa3d498fe2f78da10c40b3ea5e46c25d02b7e7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4325.0.0-darwin-arm64.tar.gz"
      sha256 "59cef080cd5879e38faa1112dded7e5e6dd775db60eca776dca3be2b240ece5b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4325.0.0-linux-x64.tar.gz"
    sha256 "11dcb260940a1f65173aa56dcf69f3ce957f61d2dab0e1e701bc8c45c1840c54"
  end
  version "4325.0.0"
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
