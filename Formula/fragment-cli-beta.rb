require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4492.0.0-darwin-x64.tar.gz"
    sha256 "0a94bbbb825797aa6446e7673babb318e98ca1215670287abe7c7f35d9c3ac29"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4492.0.0-darwin-arm64.tar.gz"
      sha256 "8d3dabbbdc590dd68b08b1633a5b48f0201151a92338c4e5468af156d031d91b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4492.0.0-linux-x64.tar.gz"
    sha256 "171d3a65e3b4f84cd7357c958961b2cd43741b4aa4ee487b74e8679ba9e55ba3"
  end
  version "4492.0.0"
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
