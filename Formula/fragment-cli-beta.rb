require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5860.0.0-darwin-x64.tar.gz"
    sha256 "69bb6dc27604d59f2b2e2e56635c694cd08bcec8ee42da9b0a03f5d05a9dd1ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5860.0.0-darwin-arm64.tar.gz"
      sha256 "503c8bf893dfc9a55bef9ea1dd27c5cbeafeb5582873b48d1dd00cb8ceae95e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5860.0.0-linux-x64.tar.gz"
    sha256 "e671a6bcbc5745a9aac76f5c7dc902c23625cdef1f7d484116c77ef64a4b2639"
  end
  version "5860.0.0"
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
