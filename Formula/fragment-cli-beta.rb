require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5284.0.0-darwin-x64.tar.gz"
    sha256 "74760a8c9be5baa6c170ca3a58212999a8b8ec5d22d28f4add8f49513554329b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5284.0.0-darwin-arm64.tar.gz"
      sha256 "90462f50ab401fdcafbea85196c0642d981e9fa7916d43d102f949a7c9262ac1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5284.0.0-linux-x64.tar.gz"
    sha256 "292c74750f828617dfde12475c98cedea7118a60efc293a367fbafd8e453ebc0"
  end
  version "5284.0.0"
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
