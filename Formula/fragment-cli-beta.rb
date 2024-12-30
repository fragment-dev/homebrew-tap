require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6006.0.0-darwin-x64.tar.gz"
    sha256 "3661341e4be6cf99eaf057f94393ccc6f23538cb614249af64ee621f0818ad91"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6006.0.0-darwin-arm64.tar.gz"
      sha256 "b7c4d0095ff1f330d31184341fc3d5cdd8a2d9e2e4f026ecee1ddc8d26e605d4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6006.0.0-linux-x64.tar.gz"
    sha256 "118a0385f5a0891cfe49b069c490df8d4e28a20dc4b766e06c116ad08dda2359"
  end
  version "6006.0.0"
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
