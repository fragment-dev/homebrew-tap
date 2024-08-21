require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5529.0.0-darwin-x64.tar.gz"
    sha256 "a66351b4caeff30e5426481f93e79198994c5bf80e8b1324489606f8cb4df2e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5529.0.0-darwin-arm64.tar.gz"
      sha256 "435faf8f6c005059e912aa768900d2e09bb32222386e6f23e6e73848e465c624"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5529.0.0-linux-x64.tar.gz"
    sha256 "6889d0c9a1a9deea516256ccd87adb2566391b24118e81a23b14cca2a33a6885"
  end
  version "5529.0.0"
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
