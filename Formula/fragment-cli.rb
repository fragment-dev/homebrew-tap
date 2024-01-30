require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.29-1-darwin-x64.tar.gz"
    sha256 "5e41066f6e0ac427db11f8cdd8c67c284bbed38834fb8b7e57f9e15815d68790"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.29-1-darwin-arm64.tar.gz"
      sha256 "780a4fc15e8b18524760791126143357ddc69282ba9dd128fb977e587100a160"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.29-1-linux-x64.tar.gz"
    sha256 "bc5d1dd98a1daf119c8326228e234f5b384976519b9e3da0b431d492cf66d30b"
  end
  version "2024.1.29-1"
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
