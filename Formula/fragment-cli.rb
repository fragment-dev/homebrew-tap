require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.23-darwin-x64.tar.gz"
    sha256 "574e603deb7d6c786a2f0524170bd9738d8a71db02d7ba29a3e4c30e8346d824"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.23-darwin-arm64.tar.gz"
      sha256 "debf7ab68980a0efd355e0ce476520660ff7910aa456fe9cf5210edecc643178"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.23-linux-x64.tar.gz"
    sha256 "361d07a58ebf3566009b848ec6c1800f8937d1447c995a34404ecf372012a4d3"
  end
  version "2023.5.23"
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
