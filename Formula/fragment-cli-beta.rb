require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4424.0.0-darwin-x64.tar.gz"
    sha256 "bb7e03f9753936752d73bd63001930aad57aa9095b9de780bf36f039eaa221bf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4424.0.0-darwin-arm64.tar.gz"
      sha256 "bccabc547e19d8f0fa83c3157aef58a48bf05af5c5ed98b75fc805df2bc437c8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4424.0.0-linux-x64.tar.gz"
    sha256 "c3d49154049af38d9fbf4f5747c227b03faaf39d924ca7c33a53c55f1016e78f"
  end
  version "4424.0.0"
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
