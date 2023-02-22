require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2062.0.0-darwin-x64.tar.gz"
    sha256 "e7445ceaf755451026729b642a2e19fe4fa6e00b29c7a4978a62d851b4f09d18"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2062.0.0-darwin-arm64.tar.gz"
      sha256 "8b324358a18de7fcda361f39ea7dc4b6a215cffbbbeb1f7baa8d3118332155be"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2062.0.0-linux-x64.tar.gz"
    sha256 "fa5f4f65e5f047885a1fca924865656ba2ea9c3621af0cc9f185052ff54a13da"
  end
  version "2062.0.0"
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
