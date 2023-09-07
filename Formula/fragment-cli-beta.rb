require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3499.0.0-darwin-x64.tar.gz"
    sha256 "2fcce3339eb091547b095dfd64e8de50b91eff291a1c4b2749dedb8778c994ce"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3499.0.0-darwin-arm64.tar.gz"
      sha256 "84aac566ecb90942cd0f1c609c9a00e0708e8b132acc16135cc0d0545d35c37b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3499.0.0-linux-x64.tar.gz"
    sha256 "074bf6268c8cc402b19c72e5e2ef251f9b74ae9aebf0e345ab74e633d6b14c76"
  end
  version "3499.0.0"
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
