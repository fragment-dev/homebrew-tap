require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.7-1-darwin-x64.tar.gz"
    sha256 "e027161f793b5588e4c673e2b39941fbf920f06975621cb058c4da73fa911535"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.7-1-darwin-arm64.tar.gz"
      sha256 "6f855cf384e77a719abb4e7539ed58c5b3930b14ebfdd153d3454ac4951392f3"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.8.7-1-linux-x64.tar.gz"
    sha256 "8c7dc93a6c2254d4131c4b24f0aa1bfdc2826c3501dd3bd02c2e4f22787abea5"
  end
  version "2025.8.7-1"
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
