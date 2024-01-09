require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.8-1-darwin-x64.tar.gz"
    sha256 "a3380436470f3a41f8216036c62854ef5a7d40e2951535282faad3bd9c87c2e7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.8-1-darwin-arm64.tar.gz"
      sha256 "9d1fd4e00951c3aa136bc962b0e15da7446bf77ca94af53e2b7d3adf5c7a11d5"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.8-1-linux-x64.tar.gz"
    sha256 "96ed5140137e4c608fe4d1267c2ec9c9f751c4dfaff598225441f5dcad4c37e3"
  end
  version "2024.1.8-1"
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
