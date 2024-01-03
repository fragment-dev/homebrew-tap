require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4256.0.0-darwin-x64.tar.gz"
    sha256 "64474ff4ae6558a2b0e98939dfbd97b1716bd911ff995856d801a1b96fa03bdf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4256.0.0-darwin-arm64.tar.gz"
      sha256 "fb2e5571dc919e4acd74a5932bccc1f9f9c1819f6c269583f41ace32c810029c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4256.0.0-linux-x64.tar.gz"
    sha256 "646bef7162bf5fca0ca621f2fc8c322efc2792cf0b22021159f36dc8f5a21f7a"
  end
  version "4256.0.0"
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
