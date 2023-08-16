require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3336.0.0-darwin-x64.tar.gz"
    sha256 "72e9367459d8b4fdb85a37bd33f623f8695527b0eb048a30b29c733c30fa983f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3336.0.0-darwin-arm64.tar.gz"
      sha256 "142c211b18432584136317f99ce5d8e21c36d9f2465bd80c95c22abac536c1cb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3336.0.0-linux-x64.tar.gz"
    sha256 "77a2fe95fa025fd90e5b5e310ae05a51f389d48dd8cf0b60b54562ce515c2596"
  end
  version "3336.0.0"
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
