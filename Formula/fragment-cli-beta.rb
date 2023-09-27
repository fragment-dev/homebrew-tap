require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3690.0.0-darwin-x64.tar.gz"
    sha256 "042cc97cfde894338823137423b6734aee24b2bfe4a1085c0bb2b54be46fa5f3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3690.0.0-darwin-arm64.tar.gz"
      sha256 "b7da8d8dae9494740b532ce4edbd5b5a27b668c8e58fcde8ceaf700913652bc0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3690.0.0-linux-x64.tar.gz"
    sha256 "8e8df1b44c22de772d4d6a4e5599134e0a9ac3ce94cf54f61b93062bd8a9f37c"
  end
  version "3690.0.0"
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
